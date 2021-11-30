# This file is part of LuaPack.
#
# LuaPack is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# LuaPack is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with LuaPack.  If not, see <https://www.gnu.org/licenses/>.
#
# For further information about LuaPack you can visit
# http://cdelord.fr/luapack

INSTALL_PATH = $(HOME)/.local/bin

BUILD = .build

all: test

clean:
	rm -rf $(BUILD)

install:
	install -T luapack $(INSTALL_PATH)/luapack

test: $(BUILD)/fib $(BUILD)/fib.exe
	# Testing native executable
	@test "`$(word 1,$^) World`" = "Hello World. fib(10) = 89"
	# Test passed
	# Testing MinGW executable with wine
	@test "`wine $(word 2,$^) World | tr -d '\r'`" = "Hello World. fib(10) = 89"
	# Test passed

$(BUILD)/fib: luapack test/main.lua test/lib.lua
	@mkdir -p $(dir $@)
	./$< -b $(BUILD) $(filter %.lua,$^) -o $@

$(BUILD)/fib.exe: luapack test/main.lua test/lib.lua
	@mkdir -p $(dir $@)
	./$< -b $(BUILD) $(filter %.lua,$^) -o $@ -w
