-- This file is part of LuaPack.
--
-- LuaPack is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- LuaPack is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with LuaPack.  If not, see <https://www.gnu.org/licenses/>.
--
-- For further information about LuaPack you can visit
-- http://cdelord.fr/luapack

local m = {}

local function fib(n)
    if n <= 1 then return 1 end
    return fib(n-1) + fib(n-2)
end

m.fib = fib

return m
