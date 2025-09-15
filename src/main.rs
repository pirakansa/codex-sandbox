use anyhow::Result;
use clap::{Parser, Subcommand};
use tracing::{info, Level};
use tracing_subscriber::EnvFilter;

#[derive(Parser, Debug)]
#[command(author, version, about)]
struct Cli {
    /// 冗長度 (-v, -vv, -vvv)
    #[arg(short, long, action = clap::ArgAction::Count)]
    verbose: u8,

    #[command(subcommand)]
    command: Commands,
}

#[derive(Subcommand, Debug)]
enum Commands {
    /// 挨拶を表示
    Hello {
        /// 名前（省略時は "world"）
        #[arg(short, long)]
        name: Option<String>,
    },
}

fn init_tracing(verbosity: u8) {
    let level = match verbosity {
        0 => Level::WARN,
        1 => Level::INFO,
        _ => Level::DEBUG,
    };
    let filter = EnvFilter::from_default_env()
        .add_directive(format!("cli_template={}", level).parse().unwrap())
        .add_directive(Level::WARN.into());

    tracing_subscriber::fmt()
        .with_env_filter(filter)
        .with_target(false)
        .compact()
        .init();
}

fn main() -> Result<()> {
    let cli = Cli::parse();
    init_tracing(cli.verbose);
    info!(?cli, "starting CLI");

    match cli.command {
        Commands::Hello { name } => {
            let msg = cli_template::greet(name.as_deref());
            println!("{}", msg);
        }
    }

    Ok(())
}
