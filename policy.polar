allow(actor, action, resource) if
    has_permission(actor, action, resource);

actor User {}

resource Organization {
    roles = ["admin", "member"];
    permissions = ["read", "create_repos"];

    "read" if "member";
    "create_repos" if "admin";

    "member" if "admin";
}

resource Repository {
    roles = ["reader"];
    permissions = ["read"];
    relations = { parent: Organization };

    "read" if "reader";

    "reader" if "member" on "parent";
}