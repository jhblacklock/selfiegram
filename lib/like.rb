class ActsAsVotable::Vote
  def user_id
    voter_id
  end

  def user_name
    User.find_by(id: voter_id).name
  end
end
