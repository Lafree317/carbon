--[[
	Carbon for Lua
	4x4 FastMatrix
]]

local Carbon = (...)
local Quaternion = Carbon.Math.Quaternion

local Matrix4x4, except = Carbon.Math.FastMatrix:Generate(4, 4)

local sin, cos = math.sin, math.cos

if (not Matrix4x4) then
	if (except.Is[Carbon.Exceptions.CodeGenerationException]) then
		print(except.GeneratedCode)
	end
	
	Carbon.Error(except)
end

-- We want all the methods from Matrix3x3 too, since they're reusable.
Matrix4x4:Inherits(Carbon.Math.Matrix3x3)

function Matrix4x4:Translate(x, y, z, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:Translation(x, y, z, out)
	return Matrix4x4:PlacementNew(out,
		1, 0, 0, x,
		0, 1, 0, y,
		0, 0, 1, z,
		0, 0, 0, 1
	)
end

function Matrix4x4:ToQuaternion(out)
	out = out or Quaternion:New()

	local trace = self[1] + self[6] + self[11] + 1

	if (trace > 0) then
		local S = 0.5 / math.sqrt(trace)
		local W = 0.25 / S

		out[1] = (self[10] - self[7]) * S
		out[2] = (self[3] - self[9]) * S
		out[3] = (self[5] - self[2]) * S
		out[4] = W
	else
		--error("OH GOD UH OH")
	end
end

function Matrix4x4:ToLooseQuaternion()
end

function Matrix4x4:Rotation(x, y, z, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:Rotate(x, y, z, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:RotateX(t, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:RotationX(t, out)
	return Matrix4x4:PlacementNew(out,
		1, 0, 0, 0,
		0, cos(t), -sin(t), 0,
		0, sin(t), cos(t), 0,
		0, 0, 0, 1
	)
end

function Matrix4x4:RotateY(t, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:RotationY(t, out)
	return Matrix4x4:PlacementNew(out,
		cos(t), 0, sin(t), 0,
		0, 1, 0, 0,
		-sin(t), 0, cos(t), 0,
		0, 0, 0, 1
	)
end

function Matrix4x4:RotateZ(t, out)
	-- todo: requires MultiplyLooseMatrix implementation
end

function Matrix4x4:RotationZ(t, out)
	return Matrix4x4:PlacementNew(out,
		cos(t), -sin(t), 0, 0,
		sin(t), cos(t), 0, 0,
		0, 0, 1, 0,
		0, 0, 0, 1
	)
end

return Matrix4x4