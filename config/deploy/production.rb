set :user, "ec2-user"

role :production do
  ec2_instances(puppet_role)
end
