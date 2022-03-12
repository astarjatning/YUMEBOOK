module ApplicationHelper

  def page_title(page_title = '')
    base_title = 'YUMEBOOK'

    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def default_meta_tags
    {
      site: 'YUMEBOOK',
      title: '今日見たゆめをシェアしよう',
      charset: 'utf-8',
      description: 'ゆめの内容をシェアするサービス。みんなのゆめを覗いてみよう。',
      keywords: 'yumebook, ゆめブック, 夢, ゆめ, dream, 夢おち',
      canonical: request.original_url,
      separator: '|',
      icon: [
      { href: image_url('favicon.ico') },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
        },
      twitter: {
        card: 'summary_large_image',
      }
    }
  end
end
