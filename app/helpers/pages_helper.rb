module PagesHelper
  def twitter_parser tweet
    tweet = "delmethomas: I’m back at a slightly damp and moody @tbtlake to see that Toby Vaughan in #Rails - but even damp and moody it’s st… https://t.co/cIvmFBJXyn"

    regex = %r{
              \b
              (
                (?: [a-z][\w-]+:
                 (?: /{1,3} | [a-z0-9%] ) |
                  www\d{0,3}[.] |
                  [a-z0-9.\-]+[.][a-z]{2,4}/
                )
                (?:
                 [^\s()<>]+ | \(([^\s()<>]+|(\([^\s()<>]+\)))*\)
                )+
                (?:
                  \(([^\s()<>]+|(\([^\s()<>]+\)))*\) |
                  [^\s`!()\[\]{};:'".,<>?«»“”‘’]
                )
              )
            }ix

    tweet.gsub(regex) do |url|
      "<a href=#{url} target='_blank'>#{url}</a>"
    end.html_safe
  end
end

