function display_notification_center
  kill -s USR1 (pidof deadd-notification-center)
end
