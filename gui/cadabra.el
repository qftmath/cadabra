;;
;;	Cadabra: a field-theory motivated computer algebra system.
;;	Copyright (C) 2001-2009  Kasper Peeters <kasper.peeters@aei.mpg.de>
;;
;;   This program is free software: you can redistribute it and/or
;;   modify it under the terms of the GNU General Public License as
;;   published by the Free Software Foundation, either version 3 of the
;;   License, or (at your option) any later version.
;;
;;   This program is distributed in the hope that it will be useful,
;;   but WITHOUT ANY WARRANTY; without even the implied warranty of
;;   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;   General Public License for more details.
;;
;;   You should have received a copy of the GNU General Public License
;;   along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;

(defun cadabra-insertion-filter (proc string)
  (with-current-buffer (process-buffer proc)
    (let ((moving (= (point) (process-mark proc))))
      (save-excursion
        ;; Insert the text, advancing the process marker.
        (goto-char (process-mark proc))
        (insert string)
        (set-marker (process-mark proc) (point)))
      (if moving (goto-char (process-mark proc))))))

(setq cdbproc (start-process "cadabra" "cadabra" "cadabra"))
(process-send-string cdbproc "@algorithms;\n")


\begin{cdb}
W_{a b c d} W_{e d e g};
@canonicalise!(%);
% W_{a b c d} W_{e d e g};
\end{cdb}