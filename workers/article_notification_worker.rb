class ArticleNotificationWorker
    include Sidekiq::Worker
  
    def perform(user_id, article_id)
        current_user = User.find(user_id)
        @article= Article.find(article_id)
      ArticleMailer.new_article_notification(current_user, @article).deliver_now
    #   ArticleMailer.new_article_notification(user, article).deliver_now
    end
  end
  