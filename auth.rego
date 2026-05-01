package auth

default allow = false

# Admin → full access
allow {
    input.user.role == "admin"
}

# Manager → read/write reports
allow {
    input.user.role == "manager"
    input.resource == "reports"
    input.action == "read"
}

allow {
    input.user.role == "manager"
    input.resource == "reports"
    input.action == "write"
}

# User → read their own profile
allow {
    input.user.role == "user"
    input.resource == "profile"
    input.action == "read"
    input.user.id == input.resource_owner_id
}