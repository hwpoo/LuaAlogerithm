function class(classname, super)
 local cls = {}  
     if super then --���ƻ��෽��  
        cls = {}  
        for k,v in pairs(super) do cls[k] = v end  
        cls.super = super  
    else  
        cls = {ctor = function() end}  
    end  
  
    cls.__cname = classname  
    cls.__index = cls  
  
    function cls.new(...) --ʵ����  
    	--this function retruns table
        local instance = setmetatable({}, cls)  
        instance.class = cls  
        instance:ctor(...)  
        return instance  
    end  
    return cls 
end