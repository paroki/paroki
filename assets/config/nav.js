export default {
    items: [
        {
            name: 'Dashboard',
            url: '/dashboard',
            icon: 'icon-speedometer',
            badge: {
                variant: 'primary',
                text: 'NEW'
            }
        },
        {
            title: true,
            name: 'Sakramentalia',
            class: '',
            wrapper: {
                element: '',
                attributes: {}
            }
        },
        {
            name: 'Baptis',
            url: '/baptis',
            icon: 'icon-user',
            badge: {
                variant: 'primary'
            }
        },
        {
            name: 'Perkawinan',
            url: '/perkawinan',
            icon: 'icon-people',
            badge: {
                variant: 'primary'
            }
        },
        {
            name: 'Komuni',
            url: '/komuni',
            icon: 'icon-check',
            badge: {
                variant: 'primary'
            }
        },
        {
            name: 'Viaticum',
            url: '/viaticum',
            icon: 'icon-chemistry',
            badge: {
                variant: 'primary'
            }
        },
        {
            name: 'Data Umat',
            url: '/under-construction',
            icon: 'icon-folder-alt'
        },
        {
            name: 'Administrasi',
            url: '#',
            children: [
                {
                    name: 'Pengguna',
                    icon: 'icon-key',
                    url: '/user/'
                }
            ]
        }
    ]
}
