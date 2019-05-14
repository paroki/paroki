<template>
  <div>
    <h1>Show {{ item && item['@id'] }}</h1>

    <div
      v-if="isLoading"
      class="alert alert-info"
      role="status">Loading...</div>
    <div
      v-if="error"
      class="alert alert-danger"
      role="alert">
      <span
        class="fa fa-exclamation-triangle"
        aria-hidden="true" /> {{ error }}
    </div>
    <div
      v-if="deleteError"
      class="alert alert-danger"
      role="alert">
      <span
        class="fa fa-exclamation-triangle"
        aria-hidden="true" /> {{ deleteError }}
    </div>
    <div
      v-if="item"
      class="table-responsive">
      <table class="table table-striped table-hover">
        <thead>
          <tr>
            <th>Field</th>
            <th>Value</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>nama</td>
            <td>{{ item['nama'] }}</td>
          </tr>
          <tr>
            <td>paroki</td>
            <td>{{ item['paroki'] }}</td>
          </tr>
          <tr>
            <td>roles</td>
            <td>{{ item['roles'] }}</td>
          </tr>
          <tr>
            <td>username</td>
            <td>{{ item['username'] }}</td>
          </tr>
          <tr>
            <td>usernameCanonical</td>
            <td>{{ item['usernameCanonical'] }}</td>
          </tr>
          <tr>
            <td>salt</td>
            <td>{{ item['salt'] }}</td>
          </tr>
          <tr>
            <td>email</td>
            <td>{{ item['email'] }}</td>
          </tr>
          <tr>
            <td>emailCanonical</td>
            <td>{{ item['emailCanonical'] }}</td>
          </tr>
          <tr>
            <td>password</td>
            <td>{{ item['password'] }}</td>
          </tr>
          <tr>
            <td>plainPassword</td>
            <td>{{ item['plainPassword'] }}</td>
          </tr>
          <tr>
            <td>lastLogin</td>
            <td>{{ item['lastLogin'] }}</td>
          </tr>
          <tr>
            <td>confirmationToken</td>
            <td>{{ item['confirmationToken'] }}</td>
          </tr>
          <tr>
            <td>accountNonExpired</td>
            <td>{{ item['accountNonExpired'] }}</td>
          </tr>
          <tr>
            <td>accountNonLocked</td>
            <td>{{ item['accountNonLocked'] }}</td>
          </tr>
          <tr>
            <td>credentialsNonExpired</td>
            <td>{{ item['credentialsNonExpired'] }}</td>
          </tr>
          <tr>
            <td>enabled</td>
            <td>{{ item['enabled'] }}</td>
          </tr>
          <tr>
            <td>superAdmin</td>
            <td>{{ item['superAdmin'] }}</td>
          </tr>
          <tr>
            <td>passwordRequestedAt</td>
            <td>{{ item['passwordRequestedAt'] }}</td>
          </tr>
          <tr>
            <td>groups</td>
            <td>{{ item['groups'] }}</td>
          </tr>
          <tr>
            <td>groupNames</td>
            <td>{{ item['groupNames'] }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <router-link
      v-if="item"
      :to="{ name: 'UserList' }"
      class="btn btn-default">Back to list</router-link>
    <button
      class="btn btn-danger"
      @click="deleteItem(item)">Delete</button>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex'

export default {
  computed: mapGetters({
    deleteError: 'user/del/error',
    error: 'user/show/error',
    isLoading: 'user/show/isLoading',
    item: 'user/show/retrieved'
  }),

  beforeDestroy () {
    this.reset()
  },

  created () {
    this.retrieve(decodeURIComponent(this.$route.params.id))
  },

  methods: {
    ...mapActions({
      del: 'user/del/del',
      reset: 'user/show/reset',
      retrieve: 'user/show/retrieve'
    }),

    deleteItem (item) {
      if (window.confirm('Are you sure you want to delete this item?')) {
        this.del(item).then(() => this.$router.push({ name: 'UserList' }))
      }
    }
  }
}
</script>
