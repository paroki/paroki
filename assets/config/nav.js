export default [
    {
        name: 'Dashboard',
        icon: 'dashboard'
    },
    {
        name: 'Sakramentalia',
        children: [
            {
                name: 'Baptis',
                icon: 'icon-user'
            },
            {
                name: 'Perkawinan',
                icon: 'icon-people',
            },
            {
                name: 'Komuni',
                icon: 'icon-check'
            },
            {
                name: 'Viaticum',
                url: '/viaticum',
                icon: 'icon-chemistry'
            }
        ]
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
