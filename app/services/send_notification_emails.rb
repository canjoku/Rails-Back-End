class SendNotificationEmails

  def initialize
    self.gibbon = Gibbon::Request.new
    self.list_id = ENV.fetch('MAILCHIMP_LIST_ID')
  end

  def self.call
    new.call
  end

  attr_accessor :gibbon, :list_id, :template_id

  def call
    begin
      campaign = gibbon.campaigns.create(body: body)
      campaign_id = campaign.body.fetch(:id)
      gibbon.campaigns(campaign_id).content.upsert(body: email_body)
      gibbon.campaigns(campaign_id).actions.send.create
    rescue Gibbon::MailChimpError => e
      puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
    end
  end


  private

  def recipients
    {
      list_id: list_id
    }
  end

  def settings
    {
      subject_line: "New Article on TBLOG",
      title: "New Article Notifications",
      from_name: "Tony Njoku",
      content:
        {
          template_id: template_id
        },
      reply_to: "ca.njoku@yahoo.com"
    }
  end

  def body
    {
      type: "regular",
      recipients: recipients,
      settings: settings,
    }
  end

  def email_body
    {
      template:
        {
          id: 50063
        }
    }
  end

end