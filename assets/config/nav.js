export default [
    {
        name: 'Dashboard',
        icon: 'dashboard'
    },
    {
        name: 'Administrasi',
        icon: 'icon-folder-alt',
        children: [
            {
                name: 'UserList',
                label: 'User',
                icon: 'people',
                url: '/user/'
            }
        ]
    }
];
