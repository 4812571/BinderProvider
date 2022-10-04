local Binder = require(script.Binder)

--[=[
    @class BinderProvider
    Binder registry class
]=]

local BinderProvider = {}
BinderProvider.__index = BinderProvider

--[=[
    @within BinderProvider
    @return BinderProvider
]=]

function BinderProvider.new()
    local self = setmetatable({}, BinderProvider)
    self._binders = {}
    return self
end

--[=[
    @within BinderProvider
    Create a new binder and store it in the registry
]=]

function BinderProvider:Add(tagName, class)
    self._binders[tagName] = Binder.new(tagName, class)
end

--[=[
    @within BinderProvider
    Returns the binder with the given name
]=]


function BinderProvider:Get(tagName)
    return self._binders[tagName]
end

--[=[
    @within BinderProvider
    Starts all the binders within the BinderProvider
]=]

function BinderProvider:Start()
    for _, binder in pairs(self._binders) do
        binder:Start()
    end
end

return BinderProvider