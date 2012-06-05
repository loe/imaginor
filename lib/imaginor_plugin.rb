class ImaginorPlugin
  include Cinch::Plugin

  match /imaginor (.+)/

  def lookup(word)
    url = "http://ajax.googleapis.com/ajax/services/search/images?q=#{CGI.escape(word)}&v=1.0"
    r = Yajl::Parser.parse(open(url)) rescue nil

    srand
    r['responseData']['results'].sample['unescapedUrl']
  end

  def execute(m, word)
    m.reply(lookup(word) || "No results found", true)
  end
end
