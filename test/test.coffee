describe "This test", ->
  it "should have one passing test", ->
    expect 1
      .toEqual 1
  it "should have one failing test", ->
    expect 2
      .toEqual 1
  xit "should have one pending test", ->
    expect 2
      .toEqual 1
