# Understanding Claude Code Sessions & Teleport

## What is `claude --teleport session_012cjzQSn6GTP1PPk4YBudwM`?

This is a **Claude Code command** that connects to a specific coding session. Here's what it means:

- **`claude`** - The Claude Code CLI command
- **`--teleport`** - A flag that transfers/connects to a session
- **`session_012cjzQSn6GTP1PPk4YBudwM`** - A unique session identifier

## How to View Claude Code Sessions Live

### Option 1: Using claudecode.link (Easiest)

1. **Export the session:**
   ```bash
   # In Claude Code terminal, type:
   /export
   # Then select "copy to clipboard"
   ```

2. **Share/View it:**
   - Go to https://claudecode.link/
   - Paste the exported session content
   - Click "Create Share Link"
   - You'll get a shareable URL to view the session

### Option 2: Claude Code Web Interface

- Access Claude Code through the web: https://docs.claude.com/en/docs/claude-code/claude-code-on-the-web
- Connect your GitHub repository
- View and manage sessions through the browser

### Option 3: Remote Access (Advanced)

If you want to view a session running on another machine:

1. **On the machine running Claude Code:**
   ```bash
   # Install tmux
   brew install tmux  # macOS
   sudo apt install tmux  # Linux
   
   # Start a named session
   tmux new -s claude
   
   # Run Claude Code inside tmux
   claude --teleport session_012cjzQSn6GTP1PPk4YBudwM
   ```

2. **From another device:**
   ```bash
   # SSH into the machine
   ssh user@machine-ip
   
   # Attach to the tmux session
   tmux attach -t claude
   ```

### Option 4: Using claudecodeui (Web UI)

An open-source web interface for managing Claude Code sessions:

```bash
git clone https://github.com/siteboon/claudecodeui.git
cd claudecodeui
# Follow setup instructions
```

This provides:
- Visual project browser
- Interactive chat interface
- File explorer and editor
- Git integration
- Task management

## Getting Session Information

To see details about your current session:

```bash
# In Claude Code terminal:
/status
```

This shows:
- Current session ID
- Session details
- Connection status

## What You Can Do With Session IDs

1. **Resume Sessions:** Continue where you left off
2. **Share Sessions:** Share the ID with collaborators
3. **Track Sessions:** Organize different coding sessions
4. **Remote Access:** Connect from different devices

## Quick Reference

| Command | Purpose |
|---------|---------|
| `claude --teleport <session-id>` | Connect to a specific session |
| `/export` | Export session for sharing |
| `/status` | View current session info |
| `tmux new -s claude` | Create persistent terminal session |
| `tmux attach -t claude` | Reattach to session |

## Notes

- Session IDs are unique identifiers for each Claude Code session
- Sessions can be shared via claudecode.link
- For live viewing, use tmux + SSH or the web interface
- Exported sessions can be viewed as static snapshots

---

**TL;DR:** The command connects to a Claude Code session. To view it live, use tmux+SSH or export it to claudecode.link for sharing.

