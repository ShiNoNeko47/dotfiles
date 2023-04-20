from __future__ import absolute_import, division, print_function
from ranger.api.commands import Command

from plugins import ranger_dotdrop


class dotdrop_import(Command):
    def execute(self):
        import subprocess

        cwd = self.fm.thisdir
        tfile = self.fm.thisfile
        if not cwd or not tfile:
            self.fm.notify("Error: no file selected!", bad=True)
            return

        files = [f.path for f in self.fm.thistab.get_selection()]
        files_str = " ".join(files)
        subprocess.Popen(
            "dotdrop import -f " + files_str,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            shell=True,
        )

        ranger_dotdrop.add_files(files)

        self.fm.reset()
        self.fm.thisdir.pointed_obj = tfile
        self.fm.thisfile = tfile


class dotdrop_remove(Command):
    def execute(self):
        cwd = self.fm.thisdir
        tfile = self.fm.thisfile
        if not cwd or not tfile:
            self.fm.notify("Error: no file selected!", bad=True)
            return

        self.fm.ui.console.ask(
            "Confirm removal of selected files from dotdrop: (y/N)",
            self._question_callback,
            ("n", "N", "y", "Y"),
        )

    def _question_callback(self, answer):
        import subprocess

        tfile = self.fm.thisfile
        if answer == "y" or answer == "Y":
            files = [f.path for f in self.fm.thistab.get_selection()]
            files_str = " ".join(files)
            subprocess.Popen(
                "dotdrop remove -f " + files_str,
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                shell=True,
            )

        ranger_dotdrop.remove_files(files)

        self.fm.reset()
        self.fm.thisdir.pointed_obj = tfile
        self.fm.thisfile = tfile
