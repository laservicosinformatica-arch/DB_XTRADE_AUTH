CREATE TABLE app_user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_app_user_roles_user
        FOREIGN KEY (user_id) REFERENCES app_users (id),
    CONSTRAINT fk_app_user_roles_role
        FOREIGN KEY (role_id) REFERENCES app_roles (id)
);

CREATE INDEX idx_app_user_roles_user_id ON app_user_roles (user_id);
CREATE INDEX idx_app_user_roles_role_id ON app_user_roles (role_id);
