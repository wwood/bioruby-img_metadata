require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "BioImgMetadata" do
  DATA_DIR = File.join File.dirname(__FILE__), 'data'
  
  it "simple" do
    d = Bio::IMG::TaxonomyDefinitionFile.read(File.join DATA_DIR, 'head.metadata.csv')
    d.kind_of?(Array).should == true
    d.length.should == 9
    d[0].kind_of?(Bio::Lineage).should == true
    
    d[0].domain.should == 'Archaea'
    d[0].attributes['Status'].should == 'Finished'
    d[1].taxon_id.should == 2515075008
  end
  
  it 'should have class equivalency TaxonomyDefinitionFile, MetadataFile' do
    Bio::IMG::TaxonomyDefinitionFile.should == Bio::IMG::Metadata
  end
end
