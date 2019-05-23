<template>
    <v-layout>
        <v-flex width="100px">
            <v-navigation-drawer permanent>
                <v-list>
                    <v-list-tile
                        v-for="item in items"
                        :key="item.title"
                        @click="activateComponent(item)"
                    >
                        <v-list-tile-action>
                            <v-icon>{{ item.icon }}</v-icon>
                        </v-list-tile-action>

                        <v-list-tile-content>
                            <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                        </v-list-tile-content>
                    </v-list-tile>
                </v-list>
            </v-navigation-drawer>
        </v-flex>
        <v-flex md8>
            <component class="sub-item" v-bind:is="active"/>
        </v-flex>
    </v-layout>
</template>

<script>
    import { mapActions, mapGetters } from 'vuex';
    import { TokenService } from '@/services';
    import ProfileForm from './Form/Biodata';
    import ProfilePassword from './Form/Password';
    import Avatar from './Form/Avatar';

    export default {
        components: {
            'profile-form': ProfileForm,
            'profile-password': ProfilePassword,
            'avatar': Avatar
        },
        computed: {
            ...mapGetters({
                retrieved: 'user/update/retrieved'
            })
        },
        data: () => {
            return {
                items: [
                    { title: 'Biodata', icon: 'mdi-dashboard', component: 'profile-form' },
                    { title: 'Foto', icon: 'mdi-person', component: 'avatar' },
                    { title: 'Password', icon: 'mdi-lock', component: 'profile-password' }
                ],
                active: 'profile-form'
            }
        },
        created() {
            const credentials = TokenService.getCredentials();
            this.getProfile(credentials.id);
        },
        methods: {
            ...mapActions({
                getProfile: 'user/update/getProfile'
            }),
            activateComponent(item){
                this.active = item.component;
            }
        }
    }
</script>
