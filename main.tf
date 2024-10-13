resource "null_resource" "delay_plan" {
  provisioner "local-exec" {
    # Use the sleep command to delay the plan for 2 minutes (120 seconds)
    command = "sleep 120"
  }

  lifecycle {
    # Trigger the delay every time by ignoring any attribute changes
    ignore_changes = [trigger]
  }

  triggers = {
    # Use a timestamp to ensure this resource runs each time
    time = timestamp()
  }
}
