Base = require('../../app/models/baseClass.coffee')

describe "@include", ->
  it "should update the prototype when an object is passed", ->
    object = {a: "test", moduleName: "test"}
    Base.include object
    expect Base.prototype.a
      .toEqual "test"

  it "should update the prototype when a list of objects is passed", ->
    object1 = {a: "test1", moduleName: "test1"}
    object2 = {b: "test2", moduleName: "test2"}
    Base.include object1, object2
    expect Base.prototype.a
      .toEqual "test1"
    expect Base.prototype.b
      .toEqual "test2"

  it "should throw an error when an array is passed", ->
    array = [{a: "test1", moduleName: "test1"}, {b: "test2", moduleName: "test2"}]
    expect( -> Base.include array )
      .toThrow(new Error ('Arguments not an object or a list of objects'))

  it "should throw an error when the module has no moduleName"

  it "should add a moduleName to the array when it is included"

  it "should keep correct scope"
