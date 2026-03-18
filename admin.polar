global {
    roles = ["admin"];
}

actor User {}

resource Tenant {
    permissions = ["read", "override_existing_environment"];

    "read" if global "admin";
    # "override_existing_environment" if global "admin";
}

test "oso employees can read all tenants" {
    setup {
        has_role(User{"sam@osohq.com"}, "admin");
    }

    assert allow(User{"sam@osohq.com"}, "read", Tenant{"1"});
}