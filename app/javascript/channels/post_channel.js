import consumer from "./consumer"

consumer.subscriptions.create("PostChannel", {
  connected() {
      console.log("toy conectado")
    },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
    // Called when there's incoming data on the websocket for this channel
  }
});
