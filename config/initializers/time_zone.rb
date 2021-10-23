require 'time'
Time.current
#=> Mon, 07 Dec 2015 18:57:51 BRST -02:00

Time.use_zone('America/Sao_Paulo') do
  starts_at = Time.zone.parse('2016-03-05 10:00')
  #=> Sat, 05 Mar 2016 10:00:00 BRT -03:00

  ends_at = Time.zone.parse('2016-03-05 17:00')
  #=> Sat, 05 Mar 2016 17:00:00 BRT -03:00
end
