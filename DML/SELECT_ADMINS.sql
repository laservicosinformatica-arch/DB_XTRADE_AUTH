SELECT 
    u.id,
    u.username,
    u.cpf,
    u.email,
    u.enabled,
    r.name AS role_name
FROM app_users u
JOIN app_user_roles ur ON ur.user_id = u.id
JOIN app_roles r ON r.id = ur.role_id
WHERE u.username = 'admin';
