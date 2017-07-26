local Vehicle = {
	_defaultColor = 'blue'
}

function Vehicle.new(init)
	-- start with init table or empty table
	init = init or {}
	self = {}

	-- Example of setter/getter
	self.getColor, self.setColor = Vehicle.getColor, Vehicle.setColor

	-- Example of read only  getter
	self._wheels = 4
	self.getWheels = Vehicle.getWheels

	-- Example of private function
	self._isColor = Vehicle._isColor

	-- Example of overloading
	self:setColor(init.color or Vehicle._defaultColor)

	return self
end

function Vehicle:_isColor(color)
	return type(color) == "string"
end

function Vehicle:setColor(color)
	assert(self:_isColor(color), 'invalid color "' .. tostring(color) .. '"')
	self._color = color
end

function Vehicle:getColor()
	return self._color
end

function Vehicle:getWheels()
	return self._wheels
end

return Vehicle
