# frozen_string_literal: true

require 'nokogiri'
doc = Nokogiri::XML(File.read('response_with_xslt.xml'))
xslt = Nokogiri::XSLT(File.read('transform.xslt'))
puts xslt.transform(doc)
