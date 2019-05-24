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
            <component
                class="sub-item"
                v-bind:is="active"
                @update-profile="handleUpdateProfile"
                @update-password="handleUpdatePassword"
            />
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
                retrieved: 'user/update/retrieved',
                error: 'user/update/error'
            })
        },
        data: () => {
            return {
                items: [
                    { title: 'Biodata', icon: 'mdi-dashboard', component: 'profile-form' },
                    { title: 'Foto', icon: 'mdi-person', component: 'avatar' },
                    {
                        title: 'Password',
                        icon: 'mdi-lock',
                        component: 'profile-password',
                        handleUpdate: 'user/update/profile'
                    }
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
                getProfile: 'user/update/getProfile',
                updateProfile: 'user/update/profile',
                updatePassword: 'user/update/profilePassword',
                snackbarSuccess: 'siap/snackbarSuccess',
                snackbarError: 'siap/snackbarError'
            }),
            handleUpdateProfile(){
                this.updateProfile().then( () => {
                    if(!this.error){
                        this.snackbarSuccess('Profil berhasil disimpan!');
                    }else{
                        this.snackbarError('Gagal menyimpan profil');
                    }
                });
            },
            handleUpdatePassword(payload){
                this.updatePassword(payload).then( () => {

                } );
            },
            activateComponent(item){
                this.active = item.component;
            }
        }
    }
</script>
