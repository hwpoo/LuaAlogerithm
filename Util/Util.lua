function class(classname, super)
 local cls = {}  
     if super then --复制基类方法  
        cls = {}  
        for k,v in pairs(super) do cls[k] = v end  
        cls.super = super  
    else  
        cls = {ctor = function() end}  
    end  
  
    cls.__cname = classname  
    cls.__index = cls  
  
    function cls.new(...) --实例化  
    	--this function retruns table
        local instance = setmetatable({}, cls)  
        instance.class = cls  
        instance:ctor(...)  
        return instance  
    end  
    return cls 
end