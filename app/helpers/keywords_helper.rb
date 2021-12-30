require 'nkf'

module KeywordsHelper
  def japanese_index
    text = ("ｱ".."ﾝ").to_a.map{ |letter| NKF.nkf("-h1w", letter) }
    text.pop
    return text
  end
end
