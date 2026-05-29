-- Admin@123456
-- BCrypt: $2y$10$t9IUKPd.V3Axhjy3uqunI.6O09QGitG5N7PfpICuiiRsLsJSLJ12C

START TRANSACTION;

INSERT INTO app_users (
    username,
    password_hash,
    cpf,
    full_name,
    email,
    enabled,
    account_non_expired,
    account_non_locked,
    credentials_non_expired
)
VALUES (
    'admin',
    '$2y$10$t9IUKPd.V3Axhjy3uqunI.6O09QGitG5N7PfpICuiiRsLsJSLJ12C',
    '00000000191',
    'Admin user',
    'laservicosinformatica@gmail.com',
    TRUE,
    TRUE,
    TRUE,
    TRUE
)
ON DUPLICATE KEY UPDATE
    id = LAST_INSERT_ID(id);

SET @admin_user_id = LAST_INSERT_ID();

INSERT INTO app_user_roles (user_id, role_id)
SELECT @admin_user_id, r.id
FROM app_roles r
WHERE r.name = 'ADMIN'
ON DUPLICATE KEY UPDATE
    user_id = user_id;

COMMIT;
