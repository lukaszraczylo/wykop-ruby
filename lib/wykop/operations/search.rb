module Wykop
  module Operations
    class Search
      def initialize(client)
        @client = client
        @request = Wykop::Operations::Request.new(@client)
      end

      def links_search(query = "ruby", page = 0, what = "all", sort = "best", kind = "all", from = nil, to = nil, votes = 0)
        # what – rodzaj znalezisk: all (wszystkie), promoted (na głównej), archive (zarchiwizowane), duplicates (duplikaty)
        # sort – sortowanie: best (najlepsze), diggs (po liczbie wykopów), comments (po liczbie komentarzy), new (po czasie dodania)
        # kind – rodzaj znalezisk: all (wszystkie), today (dzisiaj), yesterday (wczoraj), week (ostatni tydzień), month (ostatni miesiąc), range (zakres czasu)

        q_url = replace_url('index', 'links', what, sorted, kind, from, to, votes)
        q_body = Hash.new
        return @request.execute(q_url, q_body)
      end

      def replace_url(banana = nil, potato = nil)
        standard_url = "#{@client.configuration.api_host}/banana/potato/appkey,#{@client.configuration.app_user_key}/userkey,#{@client.user_info['userkey']}"
        return standard_url.gsub(/banana/, banana).gsub(/potato/, potato)
      end
    end
  end
end