Base = require('../../app/models/baseClass.coffee')

describe "@include", ->
  it "should add the module properties to an instance of the baseClass when an object is passed", ->
    module = {prop: "test", moduleName: "test"}
    Base.include module
    b = new Base
    expect b.prop
      .toEqual "test"

  it "should add all the module properties to an instance of the baseClass when a list of objects is passed", ->
    module1 = {prop1: "test1", moduleName: "test1"}
    module2 = {prop2: "test2", moduleName: "test2"}
    Base.include module1, module2
    b = new Base
    expect b.prop1
      .toEqual "test1"
    expect b.prop2
      .toEqual "test2"

  it "should throw an error when an array is passed", ->
    array = [{a: "test1", moduleName: "test1"}, {b: "test2", moduleName: "test2"}]
    expect( -> Base.include array )
      .toThrow(new Error ('Arguments not an object or a list of objects'))

  it "should store the moduleName in the includedModules array", ->
    module = {a: "test", moduleName: "test"}
    Base.include module
    expect Base.includedModules
      .toContain "test"

  it "should keep correct scope"
  # Ideas??

  it "should throw an error when the module has no moduleName", ->
    array = {a: "test1"}
    expect( -> Base.include array )
      .toThrow(new Error ('Module defined without a name'))



describe "@extend", ->
  it "should add the module properties to the baseClass when an object is passed", ->
    module = {prop: "test", moduleName: "test"}
    Base.extend module
    expect Base.prop
      .toEqual "test"

  it "should add all the module properties to the baseClass when a list of objects is passed", ->
    module1 = {prop1: "test1", moduleName: "test1"}
    module2 = {prop2: "test2", moduleName: "test2"}
    Base.extend module1, module2
    expect Base.prop1
      .toEqual "test1"
    expect Base.prop2
      .toEqual "test2"

  it "should throw an error when an array is passed", ->
    array = [{a: "test1", moduleName: "test1"}, {b: "test2", moduleName: "test2"}]
    expect( -> Base.extend array )
      .toThrow(new Error ('Arguments not an object or a list of objects'))

  it "should store the moduleName in the extendedModules array", ->
    module = {a: "test", moduleName: "test"}
    Base.extend module
    expect Base.extendedModules
      .toContain "test"

  it "should keep correct scope"
  # Ideas??

  it "should throw an error when the module has no moduleName", ->
    array = {a: "test1"}
    expect( -> Base.extend array )
      .toThrow(new Error ('Module defined without a name'))