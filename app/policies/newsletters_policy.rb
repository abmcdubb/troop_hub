class NewslettersPolicy 
  attr_reader :user, :newsletter

def initialize(user, newsletter)
  @user = user
  @newsletter = newsletter
end

  def create?
    user.role.equal?("Troop Leader")
  end
end
