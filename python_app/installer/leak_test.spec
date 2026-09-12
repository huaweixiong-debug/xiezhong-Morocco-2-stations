# PyInstaller one-folder configuration. Build only after installing optional live/UI deps.
from pathlib import Path
from PyInstaller.utils.hooks import collect_submodules
ROOT = Path(SPECPATH).parent

a = Analysis([str(ROOT / 'installer' / 'entry.py')], pathex=[str(ROOT)], datas=[(str(ROOT / 'config'), 'config')], hiddenimports=collect_submodules('app'))
pyz = PYZ(a.pure)
exe = EXE(pyz, a.scripts, a.binaries, a.datas, [], name='LeakTest2Channels', console=True)
coll = COLLECT(exe, a.binaries, a.datas, name='LeakTest2Channels')
