cask "ollama" do
  version "0.1.25"
  sha256 "89ade906f6c69c6b4451d69dcd33b36817375acdcc61137a3010de2ebeb9151e"

  url "https://github.com/jmorganca/ollama/releases/download/v#{version}/Ollama-darwin.zip",
      verified: "github.com/jmorganca/ollama/"
  name "Ollama"
  desc "Get up and running with large language models locally"
  homepage "https://ollama.ai/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with formula: "ollama"
  depends_on macos: ">= :high_sierra"

  app "Ollama.app"
  binary "#{appdir}/Ollama.app/Contents/Resources/ollama"

  zap trash: [
    "~/.ollama",
    "~/Library/Application Support/Ollama",
  ]
end
