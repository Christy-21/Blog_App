class ArticleMailer < ApplicationMailer
        def new_article_notification(user, article)
          @user = user
          @article = article
          @url  = 'http://www.gmail.com'
          mail(to: @user.email, subject: "New Article Posted")
        end
end      
