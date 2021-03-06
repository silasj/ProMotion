describe "map properties" do

  before do
    # Simulate AppDelegate setup of map screen
    @map = TestMapScreen.new modal: true, nav_bar: true
    @map.on_load
    @map.will_appear
  end

  it "should store title" do
    @map.get_title.should == "Gorges State Park, NC"
  end

  it "should have 5 annotations" do
    @map.annotations.count.should == 5
  end

  it "should convert annotation hashes to MapViewAnnotations" do
    @map.annotations.each do |annotation|
      annotation.class.to_s.should == "NSKVONotifying_MapScreenAnnotation"
    end
  end

  it "should add an annotation" do
    ann = {
      longitude: -82.966093558105,
      latitude: 35.092520895652,
      title: "Something Else"
    }
    @map.add_annotation(ann)
    @map.annotations.count.should == 6
  end

  it "should clear annotations" do
    @map.clear_annotations
    @map.annotations.count.should == 0
  end

end
