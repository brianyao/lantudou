Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '623565124338631', '695218faf272810b50cfc5f3fbced335'
  provider :twitter, '5xviWhmRAkQmGv2mT47Ygg', 'lhlCsDWq3qzPzYYthZAv0BC33SGOchufPG66mpoSbg'
end