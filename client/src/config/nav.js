export default [
    {
        name: 'Dashboard',
        icon: 'fas fa-tachometer-alt'
    },
    {
        name: 'Administrasi',
        icon: 'fas fa-screwdriver',
        children: [
            {
                name: 'UserList',
                label: 'User',
                icon: 'fas fa-user-cog',
                url: '/user/'
            }
        ]
    }
];
