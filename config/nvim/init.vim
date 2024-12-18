set runtimepath+=~/.vim,~/.vim/after

set packpath+=~/.vim
source ~/.vimrc


lua << EOF
#require("chatgpt").setup()

require("gp").setup({
    openai_api_key = "",  -- Leave empty if not required by your local server
    whisper = {
      endpoint = "http://localhost:8000/v1/audio/transcriptions"
    },
    providers = {
      openai = {
        disable = true
      },
      ollama = {
        disable = false,
        endpoint = "http://localhost:8012/v1/chat/completions" -- Replace with your local llama.cpp server
      }
    }
})


require("codecompanion").setup({
strategies = { -- Change the adapters as required
        chat = { adapter = "ollama" },
        inline = { adapter = "ollama" },
        agent = { adapter = "ollama" },
      },
  adapters = {
    ollama = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = "http://localhost:8012",
          chat_url = "/v1/chat/completions",
        },
        headers = {
          ["Content-Type"] = "application/json"
        },
        parameters = {
          sync = true,
        },
      })
    end,
  },
})
EOF
