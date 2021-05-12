class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "wakinghira73@gmail.com", subject: "Picure投稿確認メール"
  end
end
