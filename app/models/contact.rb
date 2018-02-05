# This is the very old way of sending mails From rails 3 there is a separate folder for mails


class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :phone
  attribute :position_applying_for
  attribute :file_attachment,      :attachment => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Resume - #{name} - #{email}",
      :to => "vmazza@guardstreet.com",
      :cc => 'srao@guardstreetpartners.com',
      :from => "Support <support@guardstreet.com>",
    }
  end
end
