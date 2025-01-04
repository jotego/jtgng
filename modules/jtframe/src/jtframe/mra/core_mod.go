package mra

import(
	"fmt"

	. "github.com/jotego/jtframe/def"
)

func coreMOD_dial(machine *MachineXML, cfg Mame2MRA, coremod *int) {
	for _, each := range cfg.Buttons.Dial {
		if each.Match(machine)>0 {
			if each.Raw {
				*coremod |= 1<<3
			}
			if each.Reverse {
				*coremod |= 1<<4
			}
		}
	}
}

func coreMOD_rotate(machine *MachineXML, fixed bool, coremod *int) bool {
	if machine.Display.Rotate!=0 && machine.Display.Rotate!=180 {
		*coremod |= 1
		if machine.Display.Rotate != 90 && !fixed {
			*coremod |= 4
		}
		return true
	}
	return false
}

func coreMOD_audio(machine *MachineXML, cfg Mame2MRA, coremod *int) {
	best := 0
	for _, each := range cfg.Audio.Volume {
		if lvl := each.Match(machine); lvl>best {
			best = lvl
			*coremod &= 0xff
			*coremod |= (each.Value&0xff)<<8
		}
	}
	if (*coremod&0xff00) < 0x10 { // set a default volume of 1
		*coremod |= 0x8000
	}
}

func make_coreMOD(root *XMLNode, machine *MachineXML, cfg Mame2MRA) int {
	coremod := 0
	vertical := coreMOD_rotate(machine, cfg.Global.Orientation.Fixed, &coremod)
	coreMOD_dial(machine, cfg, &coremod)
	wdiff, hdiff := coreMOD_screenSize(machine, cfg, &coremod)
	coreMOD_audio(machine, cfg, &coremod)
	// Fill MRA
	if vertical {
		root.AddNode("Vertical game").comment = true
	}
	rom := root.AddNode("rom").AddAttr("index", "1")
	if wdiff>0 || hdiff>0 {
		rom.AddNode(fmt.Sprintf("black frame %dx%d",wdiff,hdiff)).comment = true
	}
	rom.AddNode("part").SetText(fmt.Sprintf("%02X %02X", coremod&0xFF, (coremod>>8)&0xff))
	return coremod
}

// compare screen size with MAME
func coreMOD_screenSize(machine *MachineXML, cfg Mame2MRA, coremod *int) (int, int) {
	cw := Macros.GetInt("JTFRAME_WIDTH")
	ch := Macros.GetInt("JTFRAME_HEIGHT")
	wdiff := (int(cw)-machine.Display.Width)/2
	hdiff := (int(ch)-machine.Display.Height)/2
	if wdiff<0 || hdiff<0 {
		wdiff=0
		hdiff=0
		// fmt.Printf("%s: MAME reports %dx%d but core uses %dx%d\n", machine.Name, machine.Display.Width,machine.Display.Height,cw,ch)
	}
	explicit := false
	if frame_idx := bestMatch(len(cfg.Header.Frames), func(k int) int {
		return cfg.Header.Frames[k].Match(machine)
	}); frame_idx >= 0 {
		wdiff = cfg.Header.Frames[frame_idx].Width
		explicit = true
	}
	if hdiff != 0 && !explicit {
		fmt.Printf("%s: core and MAME screen sizes differ. Remove top/bottom black frame (%d pixels total)\n",machine.Name, hdiff)
	}
	switch wdiff {
		case 0: break
		case 8:  *coremod |= 1<<5
		case 16: *coremod |= 3<<5
		default: if wdiff>0 {
			fmt.Printf("%s: unsupported black frame of %d pixels around the image\nDefine one explicitly in the TOML file.\n",machine.Name,wdiff)
		}
	}
	return wdiff, hdiff
}