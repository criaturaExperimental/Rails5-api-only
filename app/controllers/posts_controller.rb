class PostsController < ApplicationController
  def index
    posts = Post.all
    if params[:filter]
      posts = posts.where(["category = ?", params[:filter]])
    end
    if params['sort']
      f = params['sort'].split(',').first
      field = f[0] == '-' ? f[1..-1] : f
      order = f[0] == '-' ? 'DESC' : 'ASC'
      if Post.new.has_attribute?(field)
        posts = posts.order("#{field} #{order}")
      end
    end
    posts = posts.page(params[:page] ? params[:page][:number] : 1)
    render json: posts, meta: pagination_meta(posts).merge(default_meta), include: ['user']
  end

  private
  def pagination_meta(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.previous_page,
      total_pages: object.total_pages,
      total_count: object.total_entries
    }
  end
end
