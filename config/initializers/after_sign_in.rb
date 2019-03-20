Warden::Manager.after_authentication do |user, auth, opts|
  if user.role == "user_minor"
    if ((Time.zone.now - user.birthdate.to_time) / 1.year.seconds).floor < 18
      user.user_minor!
    else
      user.user!
    end
  end
end
