class TestMailer < ApplicationMailer
    def test_email(email)
        mail(to: email, subject: 'Test Email from book-app')
      end
end
