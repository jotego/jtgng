/*  This file is part of JTFRAME.
    JTFRAME program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    JTFRAME program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with JTFRAME.  If not, see <http://www.gnu.org/licenses/>.

    Author: Jose Tejada Gomez. Twitter: @topapate
    Date: 4-1-2025 */

package macros

import(
	"strconv"
	"strings"
)

var macros map[string]string

func IsSet( name string ) (set bool) {
	_, set = macros[name]
	return set
}

func Get(name string) (value string) {
	value, _ = macros[name]
	return value
}

func GetInt(name string) (value int) {
	as_string, _ := macros[name]
	value, _ = strconv.Atoi(as_string)
	return value
}

func IsInt(name string) bool {
	val := Get(name)
	if val=="" { return false }
	_, e := strconv.ParseInt( val, 0, 64 )
	return e==nil
}

func Set(name, value string) {
	macros[strings.ToUpper(name)]=value
}

func Remove(all_names ...string) {
	for _, name := range all_names {
		delete(macros,name)
	}
}

func CopyToMap() (copy map[string]string) {
	copy = make(map[string]string)
	for key,val := range macros {
		copy[key]=val
	}
	return copy
}

func AddKeyValPairs( key_val ...string ) {
	for _, def := range key_val {
		split := strings.SplitN(def, "=", 2)
		var name, val string
		if len(split) >= 1 {
			name = split[0]
		}
		if name=="" { continue }
		if len(split) == 2 {
			val = split[1]
		} else {
			val="1"
		}
		Set(name,val)
	}
}

// Mostly meant to be used for unit tests
func MakeFromMap(ref map[string]string) {
	macros = make(map[string]string)
	for key,val := range ref {
		macros[key]=val
	}
}